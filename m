Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTR2r-0004rM-Aq
 for ath10k@lists.infradead.org; Tue, 17 Jan 2017 10:31:20 +0000
Received: by mail-ua0-x231.google.com with SMTP id i68so99563115uad.0
 for <ath10k@lists.infradead.org>; Tue, 17 Jan 2017 02:30:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1484594680.14978.5.camel@gmail.com>
References: <1484594680.14978.5.camel@gmail.com>
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Date: Tue, 17 Jan 2017 11:30:51 +0100
Message-ID: <CACKGw+FXdcKHU80fZ8zWwZFwePrF0GPv5ksqLEJMP-gusvOjHw@mail.gmail.com>
Subject: Re: ath10k failing with firmware RM.4.4-00022-QCARMSWPZ-2 on QCA6174
 (Killer 1535)
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
To: Chris Le Sueur <thefishface@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 16 January 2017 at 20:24, Chris Le Sueur <thefishface@gmail.com> wrote:
> Dear all,
>
> (per request by kvalo on #ath10k)
>
> I was trying out the firmware-5 from git to see if it would fix
> throughput issues, but instead the driver just failed to work. I am
> using kernel 4.8.15 on Fedora 25, and the following was printed to the
> kernel log:
>
> ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
> reset_mode 0
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-
> 0000:3a:00.0 .bin failed with error -2
> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-
> 0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> 0x00340aff sub 1a56:1535
> ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0
> testmode 0
> ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api
> 5 features wowlan,ignore-otp crc32 4d458559
> ath10k_pci 0000:3a:00.0: failed to fetch board data for bus=pci,bmi-
> chip-id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin
> ath10k_pci 0000:3a:00.0: board_file api 1 bmi_id 0:0 crc32 ed5f849a

Please try to apply this patch -
https://patchwork.kernel.org/patch/9486941/ and retry.

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
