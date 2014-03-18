Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPqFj-0003bR-AC
 for ath10k@lists.infradead.org; Tue, 18 Mar 2014 09:24:08 +0000
Received: by mail-ve0-f170.google.com with SMTP id pa12so6736392veb.15
 for <ath10k@lists.infradead.org>; Tue, 18 Mar 2014 02:23:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53280D21.9080008@dhc.com.cn>
References: <53280D21.9080008@dhc.com.cn>
Date: Tue, 18 Mar 2014 17:23:45 +0800
Message-ID: <CAEFj985UzgYe_ZcCausp5+N5iqDQ+d4gnwK_OBxaTTMWA9skPw@mail.gmail.com>
Subject: Re: [For Help]Wrong mac address when i used ath10k driver
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: wangdc <wangdc@dhc.com.cn>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Can you confirm that it is phy0 and not any others (phyX)?

----
Chun-Yeow

On Tue, Mar 18, 2014 at 5:08 PM, wangdc <wangdc@dhc.com.cn> wrote:
> Hi all,
>
> When i used the driver of the ath10k(backports-3.13.2-1) to drive the 11ac
> mini-pcie WIFI card(9880)
> on the ubuntu 12.04(based x86), the card seems to be working but i got a
> wrong mac address when
> i used the following command. Though i changed the other mini-pcie card, i
> got the same mac address.
> ---------------
> root@ubuntu:~$ cat /sys/class/ieee80211/phy0/addresses
> 00:03:07:12:34:56
> ---------------
>
> If anybody get the same this problem, could you please tell me how to fix
> it.
>
> Any suggestions would be helpful.
>
> ps:
> start log when i grep ath as following:
> root@ubuntu:~$ dmesg | grep ath
> [   25.240895] ath10k_pci 0000:04:00.0: BAR 0: assigned [mem
> 0xf0400000-0xf05fffff 64bit]
> [   25.240918] ath10k_pci 0000:04:00.0: BAR 0: set to [mem
> 0xf0400000-0xf05fffff 64bit] (PCI address [0xf0400000-0xf05fffff])
> [   25.240932] ath10k_pci 0000:04:00.0: enabling device (0000 -> 0002)
> [   25.240943] ath10k_pci 0000:04:00.0: PCI INT A -> GSI 18 (level, low) ->
> IRQ 18
> [   25.241008] ath10k_pci 0000:04:00.0: setting latency timer to 64
> [   25.241481] ath10k: MSI-X didn't succeed (1), trying MSI
> [   25.241549] ath10k_pci 0000:04:00.0: irq 45 for MSI/MSI-X
> [   25.241582] ath10k: MSI interrupt handling
> [   25.274432] ath10k: Hardware name qca988x hw2.0 version 0x4100016c
> [   26.645636] ath10k: UART prints disabled
> [   26.649723] ath10k: firmware 999.999.0.636 booted
> [   26.659427] ath10k: htt target version 2.1
> [   26.659951] ath: EEPROM regdomain: 0x0
> [   26.659953] ath: EEPROM indicates default country code should be used
> [   26.659954] ath: doing EEPROM country->regdmn map search
> [   26.659956] ath: country maps to regdmn code: 0x3a
> [   26.659958] ath: Country alpha2 being used: US
> [   26.659960] ath: Regpair used: 0x3a
> [   62.880138] type=1400 audit(1395133013.810:12): apparmor="STATUS"
> operation="profile_load" name="/usr/lib/telepathy/mission-control-5"
> pid=1117 comm="apparmor_parser"
> [   62.880710] type=1400 audit(1395133013.810:13): apparmor="STATUS"
> operation="profile_load" name="/usr/lib/telepathy/telepathy-*" pid=1117
> comm="apparmor_parser"
> [   63.953074] ath10k: MSI-X didn't succeed (1), trying MSI
> [   63.953152] ath10k_pci 0000:04:00.0: irq 45 for MSI/MSI-X
> [   63.953190] ath10k: MSI interrupt handling
> [   65.135257] ath10k: UART prints disabled
> [   65.139331] ath10k: firmware 999.999.0.636 booted
> [   65.149084] ath10k: htt target version 2.1
> [   89.023995] ath10k: timed out while waiting for scan to stop
> [   89.023998] ath10k: could not stop scan. its still in progress
> [   91.068213] type=1400 audit(1395133042.038:25): apparmor="DENIED"
> operation="open" parent=2372 profile="/usr/lib/telepathy/mission-control-5"
> name="/usr/local/lib/libsqlite3.so.0.8.6" pid=2373 comm="mission-control"
> requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
>
> Thanks.
>
> Rex wang
> 2014-03-07
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
