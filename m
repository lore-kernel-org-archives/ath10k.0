Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4WbY-0005qi-AA
 for ath10k@lists.infradead.org; Mon, 15 Jun 2015 15:47:20 +0000
Received: by ykaz81 with SMTP id z81so59787195yka.3
 for <ath10k@lists.infradead.org>; Mon, 15 Jun 2015 08:46:58 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Jun 2015 11:46:56 -0400
Message-ID: <CAOt_L3_dnEWrkZMcyKJPvZyTUWQDzte=oQXpxw00AY8HZUtdFw@mail.gmail.com>
Subject: Survey dump and spectral scan
From: Amato Carbonara <acarbonara13@gmail.com>
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
To: ath10k <ath10k@lists.infradead.org>

Does anyone have any experience with either of these commands with ath10k:
1. iw wlan0 survey dump
2. spectral scan:
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral

I am running ath10k firmware version 10.2.4.48 on a QCA-9880 chipset.
Kernel version 4.0

Specific questions:
1. Survey dump:
    a) Do I have to be associated/connected to an AP on a specific
channel in order to receive the correct information?
    b) I understand the active time is the amount of time the channel
is busy.  What is the receive time?

2. Spectral scan = In the link provided, the following is stated:
"you can use the following commands while having an open connection
(e.g. running an AP)"
Does this mean the adapter needs to be in AP mode?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
