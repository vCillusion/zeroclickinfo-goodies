package DDG::Goodie::PublicDNS;

use DDG::Goodie;
use File::ShareDir::ProjectDistDir;
use IO::All;

triggers query_clean => qr/^(?:google|opendns|norton|dns advantage)?\s*public dns\s*(?:servers?)?$/i;

zci is_cached => 1;

zci answer_type => 'dns';

handle sub {
	scalar io(dist_dir('DDG-GoodieBundle-OpenSourceDuckDuckGo').'/publicdns/publicdns.txt')->slurp,
	html => scalar io(dist_dir('DDG-GoodieBundle-OpenSourceDuckDuckGo').'/publicdns/publicdns.html')->slurp
};

1;