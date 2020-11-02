Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZepo-0003pA-R3
 for ath10k@lists.infradead.org; Mon, 02 Nov 2020 18:45:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id gn41so2984712ejc.4
 for <ath10k@lists.infradead.org>; Mon, 02 Nov 2020 10:45:40 -0800 (PST)
MIME-Version: 1.0
From: Guilherme Rios <gasrios@gmail.com>
Date: Mon, 2 Nov 2020 15:45:28 -0300
Message-ID: <CAJmnWTgv9dAsW0umnVJCfbp7f7V4ya_4gv9ci_He7YuBcPEWsg@mail.gmail.com>
Subject: QCA9377 monitor mode firmware support
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

Hi,

Is there any particular reason monitor mode firmware support was
dropped from QCA9377?

I did some tests on an IdeaPad 320 laptop running Ubuntu 20.04, with
different firmware versions obtained from
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
, and here is what I found:

- Up until commit dd5fba3a56bbb4c4a72576faa19f8bd45fed7ef6, monitor
mode was working (I have seen reports that packet injection was never
supported for this particular chipset; as my use case does not involve
this, I didn't care testing to confirm);

- Starting from 56e5de3261877e5ca9df285e0751368c72b0861a, the driver
behaves as if monitor mode is supported: airmon-ng reports
successfully setting the card to monitor mode, and airodump-ng acts as
if it is collecting data, but no output is ever shown.

I have traced the issue to files firmware-5.bin and firmware-6.bin,
which were respectively updated and created by that commit (board.bin
and board-2.bin were not changed by it).

It called my attention that the message associated to the commit that
dropped monitor mode support was "[e]ven though the version number
suggests that this is an older firmware release it's actually more
recent as this is from a different branch."

Any chance monitor mode support was accidentally lost in this branch,
or was this change made by design?

Are there any issues I should be aware of, if I choose to downgrade
the firmware in order to keep monitor mode support?

Thanks,

Guilherme

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
