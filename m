Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haZrC-0002hA-Vm
 for ath10k@lists.infradead.org; Tue, 11 Jun 2019 06:02:08 +0000
Received: by mail-qt1-x836.google.com with SMTP id a15so13157045qtn.7
 for <ath10k@lists.infradead.org>; Mon, 10 Jun 2019 23:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8Lp45wxQ3vL_ttq-yKYDxscjn2KyJVCx_vJBCn+u8Yc5QtOQ@mail.gmail.com>
 <87h89lei7e.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h89lei7e.fsf@kamboji.qca.qualcomm.com>
From: Daniel Drake <drake@endlessm.com>
Date: Tue, 11 Jun 2019 14:01:53 +0800
Message-ID: <CAD8Lp455PaQYqC0PKYK_2_nP2dP_bn=eCJnpiJP3=Dh34B0whw@mail.gmail.com>
Subject: Re: ath10k QCA9377 firmware crashes and fails to recover
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Endless Linux Upstreaming Team <linux@endlessm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Kalle,

On Thu, May 23, 2019 at 3:36 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Daniel Drake <drake@endlessm.com> writes:
>
> > We are experiencing failures with QCA9377 wifi, using Linux 4.18 and
> > Linux 5.0 with the latest firmware version:
> >
> > ath10k_pci 0000:02:00.0: firmware crashed! (guid
> > 54a4649a-1240-4459-9442-9d498c49de79)
> > ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
> > 0x003821ff sub 1a3b:2b31
> > ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> > ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5
> > api 5 features ignore-otp crc32 c3e0d04f
>
> Is this a regression? For example, have you tried older firmware
> versions?

Sorry for the delayed response, as we were testing old versions.
It doesn't seem to be a regression, at least we tested:

Linux 5.0 / latest firmware API 6
ath10k_pci 0000:02:00.0: firmware crashed! (guid
697a3b62-bf3a-4953-bf3d-058eb3b828ff)
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
0x003821ff sub 1a3b:2b31
ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api
6 features wowlan,ignore-otp crc32 42e41877
ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8aedfa4a
ath10k_pci 0000:02:00.0: htt-ver 3.56 wmi-op 4 htt-op 3 cal otp
max-sta 32 raw 0 hwcrypto 1

Linux 4.18 / latest firmware API 5
ath10k_pci 0000:02:00.0: firmware crashed! (guid
54a4649a-1240-4459-9442-9d498c49de79)
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
0x003821ff sub 1a3b:2b31
ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5
api 5 features ignore-otp crc32 c3e0d04f

Linux 4.15 / older firmware
ath10k_pci 0000:02:00.0: firmware crashed! (guid
7e1505fa-49e1-4fab-a7c5-a2352f1a47f6)
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
0x003821ff sub 1a3b:2b31
ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5
features ignore-otp crc32 79cea2c7
ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8aedfa4a
ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta
32 raw 0 hwcrypto 1

Linux 4.13 / same older firmware
ath10k_pci 0000:02:00.0: firmware crashed! (uuid
701e7d5e-b405-408c-ae27-7de285c38c8f)
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
0x003821ff sub 1a3b:2b31
ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00267-1 api 5
features ignore-otp crc32 79cea2c7
ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8aedfa4a
ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta
32 raw 0 hwcrypto 1

Any further suggestions?

Thanks
Daniel

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
