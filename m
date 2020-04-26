Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSmQq-0004DJ-R9
 for ath10k@lists.infradead.org; Sun, 26 Apr 2020 18:55:14 +0000
Received: by mail-il1-x142.google.com with SMTP id f82so14591191ilh.8
 for <ath10k@lists.infradead.org>; Sun, 26 Apr 2020 11:55:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALY5VB3=0=M-QjHquL8GpU=Mw5d3v+EjE2zYv_rqEp5vOFZ5EA@mail.gmail.com>
References: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
 <CAKR_QVJvko9VidtC-uR2XdwmYV_e3sm4rN-0162gpnkj7hFgZA@mail.gmail.com>
 <CALY5VB3=0=M-QjHquL8GpU=Mw5d3v+EjE2zYv_rqEp5vOFZ5EA@mail.gmail.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Sun, 26 Apr 2020 20:55:10 +0200
Message-ID: <CAKR_QVKaENYxa3-8cBr7Oypu6t-JW+_qb1d-gSyw8GV0f4x-ww@mail.gmail.com>
Subject: Re: Poor link speeds and signal strength on Qualcomm QCA 9377
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
To: Arvind Bakshi <arvindbakshicool@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 25/04/2020, Arvind Bakshi <arvindbakshicool@gmail.com> wrote:
> Output of dmesg | grep ath10k:
>
> [   17.064613] ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [   17.081365] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0
> [   17.437946] ath10k_pci 0000:01:00.0: qca9377 hw1.1 target
> 0x05020001 chip_id 0x003821ff sub 1028:1810
> [   17.437948] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1
> tracing 1 dfs 0 testmode 0
> [   17.438532] ath10k_pci 0000:01:00.0: firmware ver
> WLAN.TF.2.1-00021-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32
> 42e41877
> [   17.510771] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id N/A
> crc32 8aedfa4a
> [   17.587956] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
> [   17.606733] ath10k_pci 0000:01:00.0: htt-ver 3.56 wmi-op 4 htt-op 3
> cal otp max-sta 32 raw 0 hwcrypto 1
> [   17.695763] ath10k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> [   22.040673] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
>
> Output of uname -a :
>
> Linux ubuntu 5.4.0-26-generic #30-Ubuntu SMP Mon Apr 20 16:58:30 UTC
> 2020 x86_64 x86_64 x86_64 GNU/Linux
>
> Thanks & Regards
>
> Arvind
>
> On Sat, Apr 25, 2020 at 12:37 PM Tom Psyborg <pozega.tomislav@gmail.com>
> wrote:
>>
>> On 25/04/2020, Arvind Bakshi <arvindbakshicool@gmail.com> wrote:
>> > Sir/Mam
>> >
>> > Getting 1 mbps link speed and average signal strength, even on
>> > standing next to router on every linux distro whereas windows 10 gives
>> > 150 mbps link speeds and excellent signal strength even standing quite
>> > far off from router. Tested on Fedora 30/31 and ubuntu 18.04/20.04.
>> > Turning off wireless power management : sudo iwconfig wlan0 power off
>> > doesn't make a difference.
>> > Turning off all power saving options using TLP also doesn't make a
>> > difference.
>> > Software (OS, Firmware version, kernel, driver, etc)
>> > Tested on Fedora 30/31 and ubuntu 18.04 LTS
>> > Wifi card: Qualcomm QCA 9377
>> > Device: Dell Vostro 3468 (shipped with ubuntu 16.04)
>> >
>> > Hardware (NIC chipset, platform, etc)
>> > Qualcomm QCA 9377
>> >
>> >
>> >
>> > Please provide driver fix for this wireless card.
>> >
>> > Thanks & Regards
>> >
>> > Arvind Bakshi
>> >
>> > _______________________________________________
>> > ath10k mailing list
>> > ath10k@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/ath10k
>> >
>>
>> Hi
>>
>> Show output of "dmesg | grep ath10k" and "uname -a" on ubuntu
>

I have exact same card, works fine on recently installed and updated
ubuntu 19.10 with kernel 5.3.0

How did you end up on 5.4.0 with ubuntu 18.04? From update manager?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
