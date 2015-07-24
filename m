Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIZWH-00018u-AM
 for ath10k@lists.infradead.org; Fri, 24 Jul 2015 09:43:58 +0000
Received: by wibxm9 with SMTP id xm9so20096449wib.1
 for <ath10k@lists.infradead.org>; Fri, 24 Jul 2015 02:43:33 -0700 (PDT)
Subject: Re: QCA6174 hw2.1 on Clevo P750ZM
References: <55B0A037.8070102@gmail.com>
 <CA+BoTQmvAgeCoHoTvc7XOGcr7x7x49gcJ9WC9t9jo8MjjHNMBg@mail.gmail.com>
 <55B0AA27.2060205@gmail.com>
 <CA+BoTQm-BHp9Gi550xte6F=cK3snYXRK0r=g=9vOn-Y2jde-hQ@mail.gmail.com>
 <55B0B4E7.7040106@gmail.com>
 <CA+BoTQkffQ0UdhF7hvNVaNxtDsOUJLz2qi3vMLp+BM5EsKbk6A@mail.gmail.com>
 <55B0BDD3.4080103@gmail.com>
 <CA+BoTQmceF3xitMz1p6WFp3FVnOme4kpQaK=9ouAjyK4zwbvnQ@mail.gmail.com>
 <55B0C416.90903@gmail.com> <55B0F007.7050408@gmail.com>
 <87oaj3gedw.fsf@kamboji.qca.qualcomm.com>
From: Alexandre Maloteaux <a.maloteaux@gmail.com>
Message-ID: <55B216D0.5090600@gmail.com>
Date: Fri, 24 Jul 2015 11:43:28 +0100
MIME-Version: 1.0
In-Reply-To: <87oaj3gedw.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi i would like to test with other board.bin but i m facing the  timeout
issue. Each time the ath10k_pci module fail with a firmware there is a
timeout of 1 minute before testing the next one. Any idea what could help ?

[Fri Jul 24 11:10:02 2015] ath10k_pci 0000:06:00.0: pci irq legacy
interrupts 0 irq_mode 1 reset_mode 0
[Fri Jul 24 11:10:03 2015] ath10k_pci 0000:06:00.0: Direct firmware load
for ath10k/cal-pci-0000:06:00.0.bin failed with error -2
[Fri Jul 24 11:10:03 2015] ath10k_pci 0000:06:00.0: Falling back to user
helper
[Fri Jul 24 11:11:03 2015] ath10k_pci 0000:06:00.0: Direct firmware load
for ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[Fri Jul 24 11:11:03 2015] ath10k_pci 0000:06:00.0: Falling back to user
helper
[Fri Jul 24 11:12:03 2015] ath10k_pci 0000:06:00.0: could not fetch
firmware file 'ath10k/QCA6174/hw2.1/firmware-5.bin': -11
[Fri Jul 24 11:12:04 2015] ath10k_pci 0000:06:00.0: qca6174 hw2.1
(0x05010000, 0x003405ff, 168c:003e:1a56:1525) fw killer-n1525-fw api 4
htt-ver 3.0 wmi-op 4 htt-op 3 cal otp max-sta 32 features
\xffffff80\xffffff94\xfffffff8\xffffff96\xffffff88\xffffffff\xffffffff
[Fri Jul 24 11:12:04 2015] ath10k_pci 0000:06:00.0: debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[Fri Jul 24 11:12:04 2015] ath: EEPROM regdomain: 0x6c
[Fri Jul 24 11:12:04 2015] ath: EEPROM indicates we should expect a
direct regpair map
[Fri Jul 24 11:12:04 2015] ath: Country alpha2 being used: 00
[Fri Jul 24 11:12:04 2015] ath: Regpair used: 0x6c
[Fri Jul 24 11:12:04 2015] ath10k_pci 0000:06:00.0 wlp6s0: renamed from
wlan0
[Fri Jul 24 11:14:42 2015] ath10k_pci 0000:06:00.0: no channel
configured; ignoring frame(s)!
[Fri Jul 24 11:19:57 2015] ath10k_pci 0000:06:00.0: no channel
configured; ignoring frame(s)!
[Fri Jul 24 11:21:00 2015] ath10k_pci 0000:06:00.0: no channel
configured; ignoring frame(s)!
[Fri Jul 24 11:21:00 2015] ath10k_pci 0000:06:00.0: no channel
configured; ignoring frame(s)!
[Fri Jul 24 11:34:54 2015] CPU: 2 PID: 14153 Comm: hexchat Tainted:
P           O    4.2.0-rc3-wl-ath-KVALO-ATH-MASTER+ #4
[Fri Jul 24 11:34:54 2015]  [<ffffffff8156b3ee>]
entry_SYSCALL_64_fastpath+0x12/0x71
[Fri Jul 24 11:37:50 2015] ath10k_pci 0000:06:00.0: no channel
configured; ignoring frame(s)!


On 07/23/2015 03:03 PM, Kalle Valo wrote:
> Alexandre Maloteaux <a.maloteaux@gmail.com> writes:
>
>> 0x003405ff, 168c:003e:1a56:1525 fallback) fw killer-n1525-fw api 4
>> htt-ver 3.0 wmi-op 4 htt-op 3 cal otp max-sta 32 features
>> \xffffff80\xffffffd4\xffffffa8\xfffffff9\xffffff88\xffffffff\xffffffff
> What's happening with the features string here? What might cause that?
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
