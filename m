Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1getHF-0005ED-Km
 for ath10k@lists.infradead.org; Thu, 03 Jan 2019 03:02:34 +0000
Received: by mail-io1-xd2b.google.com with SMTP id g8so14710649iok.4
 for <ath10k@lists.infradead.org>; Wed, 02 Jan 2019 19:02:33 -0800 (PST)
MIME-Version: 1.0
References: <CAKHTHFX7twj11AxUbuxT_OxghmRdS0YNnBZhHOA3oMf8MvQPaA@mail.gmail.com>
In-Reply-To: <CAKHTHFX7twj11AxUbuxT_OxghmRdS0YNnBZhHOA3oMf8MvQPaA@mail.gmail.com>
From: =?UTF-8?Q?Ant=C3=B3n_Valladares_Poncela?= <labaunti3@gmail.com>
Date: Thu, 3 Jan 2019 04:02:21 +0100
Message-ID: <CAKHTHFWhRJiCOms87JComo-ys6RHPHOvhL3D+xTUWFHXwi3dMA@mail.gmail.com>
Subject: Fwd: [BUG REPORT] QCA6174 Killer Wireless 1535 monitor mode not
 working.
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
To: ath10k@lists.infradead.org

So I have a Dell XPS 9570 with a Killer Wireless 1535 adapter, which
is based off the QCA6174 and uses the ath10k_pci driver.

I wanted to try monitor mode but apparently I can't get it to actually
do anything. I can get the card to monitor mode, but once there, it
doesn't actually do anything.
Airodump-ng shows absolutely nothing, no APs, no stations. Nothing.
Other wireless tools act exactly the same.

Im on kernel 4.20.0-1-MANJARO and the firmware is RM.4.4.1.c2-00057-QCARMSWP-1.

Seems like everyone else with this PC and wireless card is having the
same issue where monitor mode just doesn't do anything. There are
several forum posts over at aircrack, kali, and ubuntu forums.

Any help or update on this would be well appreciated as there are
several users which have already begun switching to other wireless
adapters because of this.

Thanks in advance.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
