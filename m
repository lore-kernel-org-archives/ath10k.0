Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx-out.tlen.pl ([193.222.135.148])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dS8yg-0007Mu-It
 for ath10k@lists.infradead.org; Mon, 03 Jul 2017 21:33:56 +0000
Received: from unknown (HELO [10.1.1.5]) (hyniu@o2.pl@[195.43.67.135])
 (envelope-sender <hyniu@o2.pl>) by smtp.tlen.pl (WP-SMTPD) with SMTP
 for <ath10k@lists.infradead.org>; 3 Jul 2017 23:33:25 +0200
From: Henryk Heisig <hyniu@o2.pl>
Subject: [PATCH] QCA9888 hw2.0: Add QCA9886 to board-2.bin
Message-ID: <9c5d3e03-8d0f-596b-4e9a-f549342a450c@o2.pl>
Date: Mon, 3 Jul 2017 23:33:25 +0200
MIME-Version: 1.0
Content-Language: pl
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This patch adding QCA9886 wlan device used in
Archer C58/C59/C60 with bus=pci,bmi-chip-id=0,bmi-board-id=20mmm

Signed-off-by: Henryk Heisig <hyniu@o2.pl>
---
  QCA9888/hw2.0/board-2.bin | Bin 72788 -> 84916 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/QCA9888/hw2.0/board-2.bin b/QCA9888/hw2.0/board-2.bin
index 4bb72e3352fe0b190e24734a55c116a0b672621f..7090a8190336eae0b37f1c49d01f255f6c6fcaf7 100644
GIT binary patch
delta 2826
zcmeH}Ur19?9LLYyKl`(q%dNH$88X_G!c|lkDK;grtYBG+w<M$|IV4$HlP+?NB9@#?
zJ!^|{Hp7Qeb}+7i4+RE2gj5tr^iV-Q^;lrhA87r~Jl2ydh~Z1W!|#56=l8w8^Sg)3
zJ>2OD(|E!>*3v5nT3cHsgpj9#``c@hgp69GBL*|%d<Q}^LZ>1I2oQ20WZ29DgV{*?
zjShp{Mn6|5(nSA<63IjFntZYib$gJfYNrVm!VqTX%w#e_PWK9a1zWQWE<sd~HTo=|
z?{~Z1i2J-16%`@w^JcMF5chfe!`y164}I0TW7E(Q2~oYW)bQgIWDe+4%byx8jV&ZK
z{(uhKoHVe{tFZ)2kWSo$o7iwNu68Q*N<B&AsB%oM^>0kxRxe_8SDhT<z5A~CeMl4>
z#)qLGAqwu`OUiM1k3T?es+aNET?gfAUeF)s1u+&Q9XO1`Y$(~Ub||}*-Q*S~O1m8P
z(|bXidm!%fBi6%ulB#-0J;biF>!b@e<7WCM=yDGv_##mjO`cK1YB<~f46euZbY+OE
zzH-FQv2)2&YNcAq;w(;1<2qbNgL5j>cJV<Jbu%N3BsCnwLD~i?O_W352p^=D)Upfg
zLb6kBP#frQ$Yr8e{blrH`$v6j)k&lN+#EIN>6%#+m4Z%MW86VgMvFP!*Cq$(*S$CN
z?k%$horEVPt)yffH*cwDQ6lZnjf;OhU>+h(>^%=l|JBM`9vhc%D_-kby?WtD%Pr?u
zJ#V&a(zlEe^_lHi4ho)k&dvJ-2L+>`zl1L}CYTb8f}YI_rUVJ-R=EGF;D{grJ)3uG
zbHRv6q~V4T9JHf?X~<{ig7+bBg9Rsn5#S>r06i9b!s$ooIS`K0%(UPuAU|j)xDFO=
zcVt;;GufqrZnI}QvP;$GvKRV^Emn!9eJ(ocbAZP}@26&_bNTD3nU}d7&e9O|G#=5s
zi)%;o-=1d5x)ytz|NH0vJ?HAsluP_qjiy$5>6i81#eT`kziwo~dOEvd>#+sZJP7bV
eTJHLemZI<I_b($q8;iGDBwDpGrOUm=y*~lU7Cz|!

delta 14
Wcmdloo%PBNmJJzwn@{Y0(+dDOBnUVF



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
