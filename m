Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac5zH-0001s0-1N
 for ath10k@lists.infradead.org; Sat, 05 Mar 2016 06:46:51 +0000
Received: by mail-vk0-x229.google.com with SMTP id c3so74693579vkb.3
 for <ath10k@lists.infradead.org>; Fri, 04 Mar 2016 22:46:30 -0800 (PST)
From: gloudon.jamie@gmail.com
Date: Sat, 5 Mar 2016 02:46:12 -0400
Subject: Re: QCA6174 firmware crash in monitor mode
Message-ID: <20160305064544.GA1809@darkstar>
References: <20160213063926.GA1767@darkstar>
 <8737s7372f.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8737s7372f.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "gloudon.jamie@gmail.com" <gloudon.jamie@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Mar 03, 2016 at 03:38:37PM +0000, Valo, Kalle wrote:
> gloudon.jamie@gmail.com writes:
> 
> > QCA6147 monitor mode stopped working ever since after kernel v4.3.
> > Here is the firmware crash log:
> >
> > Feb 13 01:39:36 darkstar kernel: [   34.010363] ath10k_pci 0000:01:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 168c:3344
> > Feb 13 01:39:36 darkstar kernel: [   34.010373] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
> > Feb 13 01:39:36 darkstar kernel: [   34.012252] ath10k_pci 0000:01:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,no-4addr-pad crc32 10bf8e08
> > Feb 13 01:39:36 darkstar kernel: [   34.012291] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 cdb586cf
> > Feb 13 01:39:36 darkstar kernel: [   34.012301] ath10k_pci 0000:01:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> > Feb 13 01:39:36 darkstar kernel: [   34.067918] ieee80211 phy0: Hardware restart was requested
> >
> > Feb 13 01:39:36 darkstar kernel: [   34.010318] ath10k_pci 0000:01:00.0: firmware crashed! (uuid cb6fc88d-918d-4c7a-af69-15a713136bf7)
> > Feb 13 01:39:36 darkstar kernel: [   34.014330] ath10k_pci 0000:01:00.0: firmware register dump:
> > Feb 13 01:39:36 darkstar kernel: [   34.014340] ath10k_pci 0000:01:00.0: [00]: 0x05010000 0x00000000 0x0099987C 0x00000000
> > Feb 13 01:39:36 darkstar kernel: [   34.014349] ath10k_pci 0000:01:00.0: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
> 
> Does this patch fix it?
> 
> ath10k: fix firmware assert in monitor mode
> 
> https://patchwork.kernel.org/patch/8481281/
> 
> -- 
> Kalle Valo

Yes, the patch works. Thanks! Forgot to CC ath10k mailing list.

Regards,
Jamie Gloudon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
