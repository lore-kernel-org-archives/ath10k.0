Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from lanada.kaist.ac.kr ([143.248.57.170])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1cFK-0000hT-DI
 for ath10k@lists.infradead.org; Sun, 07 Jun 2015 15:12:23 +0000
Received: from localhost (lanada.kaist.ac.kr [127.0.0.1])
 by lanada.kaist.ac.kr (Postfix) with ESMTP id 6725413FDCEC
 for <ath10k@lists.infradead.org>; Mon,  8 Jun 2015 00:18:12 +0900 (KST)
Received: from lanada.kaist.ac.kr ([127.0.0.1])
 by localhost (lanada.kaist.ac.kr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwJZ5nnntMdP for <ath10k@lists.infradead.org>;
 Mon,  8 Jun 2015 00:18:12 +0900 (KST)
Message-ID: <557460CE.5060400@lanada.kaist.ac.kr>
Date: Mon, 08 Jun 2015 00:18:38 +0900
From: Sangwoo Moon <swmoon@lanada.kaist.ac.kr>
MIME-Version: 1.0
Subject: Configuring ath10k device driver supporting 802.11ac and IBSS
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

Hello,

I am currently trying to configure ath10k device
to support 802.11ac VHT functionality in IBSS mode.

I am using Qualcomm Atheros QCA988x 802.11ac network adapter
in Gigabyte M1405 laptop.
I am using Ubuntu 14.04.2 (kernel version 3.16.0-30-generic) as
main operating system, and using backports-3.16-rc1-1 as
ath10k device driver.

As far as I know, I can use iw to configure a WLAN interface
into IBSS mode (ad-hoc mode),
and hostapd to configure the interface enabling 802.11ac VHT 
functionalities.

However, what I want to do is enabling 802.11ac VHT features, in
IBSS mode.

After series of searching, I could not find any solutions to
neither turn on VHT mode in iw nor using IBSS mode in hostapd.
I used the latest version of iw (4.1) and hostapd (2.4) trying to solve 
this issue.
I also installed the latest wireless-regdb-2015.06.05 to mitigate
the regulatory issue in frequency band selection.

Is there anyone who can help with this issue?
Thanks in advance.

Best regards,
--Sangwoo Moon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
