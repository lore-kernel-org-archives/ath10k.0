Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGiO5-0004c1-4v
 for ath10k@lists.infradead.org; Tue, 24 Mar 2020 12:10:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k_pci rawmode = 1 requires support from firmware
References: <CAG2Q2vXt3af3ATRnFNW8bA2BbaQ47fLsS1dL1iJ6JGQg=kbJSQ@mail.gmail.com>
Date: Tue, 24 Mar 2020 14:10:16 +0200
In-Reply-To: <CAG2Q2vXt3af3ATRnFNW8bA2BbaQ47fLsS1dL1iJ6JGQg=kbJSQ@mail.gmail.com>
 (Cale Collins's message of "Fri, 21 Feb 2020 12:26:04 -0800")
Message-ID: <87ftdy7y3b.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Cale Collins <ccollins@gateworks.com>
Cc: ath10k@lists.infradead.org

Cale Collins <ccollins@gateworks.com> writes:

> When attempting to bring up my mesh0 interface, I recieve an error and
> in "dmesg":
>
> [  901.629999] ath10k_pci 0001:90:00.0: must load driver with
> rawmode=1 to add mesh interfaces
>
> I enable this mode by changing my bootargs, appending "ath10k_core.rawmode=1".
>
> On boot "dmesg" reports:
>
> [   12.040581] ath10k_pci 0001:90:00.0: rawmode = 1 requires support
> from firmware
>
> Where does this "supported" firmware come from?
>
> I'm using SparkLAN WPEQ-261ACNI(BT) 802.11ac/abgn + BT PCI Express
> Mini Card (Half) - Qualcomm QCA6174A-5 chipset, with a mainline 4.20.7
> kernel and Ubuntu Bionic root filesystem.
>
> Thank you for looking into this, I'm glad to provide more information if needed.

Not all firmware branches support raw mode. The firmware will have
raw-mode feature bit enabled if it support raw mode, you can check it
like this:

$ ath10k-fwencoder --info firmware-6.bin_WLAN.RM.4.4.1.c3-00059 | grep Features
Features: wowlan,ignore-otp-result,no-nwifi-decap-4addr-padding,raw-mode,mfp-support

For QCA6174 with raw mode I recommend using 4.4.1.c3 branch:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1.c3

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
