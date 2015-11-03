Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztipw-0005uA-34
 for ath10k@lists.infradead.org; Tue, 03 Nov 2015 21:09:48 +0000
Received: by wikq8 with SMTP id q8so80016928wik.1
 for <ath10k@lists.infradead.org>; Tue, 03 Nov 2015 13:09:25 -0800 (PST)
MIME-Version: 1.0
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Tue, 3 Nov 2015 13:08:56 -0800
Message-ID: <CAD1M061m8zm9wNxWtpoAm+vuMYU50Oesg9HGn-WEVXGi4B=B1A@mail.gmail.com>
Subject: IBSS on WLE900VX
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Using the 20150923 backports and the '636' firmware, I found that I
cannot get certain radio's to merge when in IBSS. Both radios will
create their own IBSS network, but if I give them the same BSSID, they
will each create their own and never see one another (and thus never
merge). From my testing, I found that a pair of WLE900VX's will fail
to merge, while a pair of WLE900N5-20's will merge just fine. I'm
using iw v4.1 and have tried both HT20 and HT40 to create my network.
I have yet to try wpa_supplicant.

Does anyone have any idea as to why this is occurring?

Thanks,
- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
