Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhp4-0004kZ-Fe
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 20:12:30 +0000
Received: by mail-io0-x242.google.com with SMTP id r9-v6so3933409iod.6
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 13:12:14 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
Subject: [PATCH 0/9] Loading optional firmware v4
Date: Mon, 23 Apr 2018 16:11:56 -0400
Message-Id: <20180423201205.20533-1-andresx7@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: arend.vanspriel@broadcom.com, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, andresx7@gmail.com, alexdeucher@gmail.com, christian.koenig@amd.com, kvalo@codeaurora.org

Hey Everyone,

This is a trimmed down version of v3 that contains the changes for which we
have agreement. Changes that raised concern are being shifted to a followup
series, mainly changes to the async firmware API.

Inline feedback I received in these patches has also been addressed, thanks
everyone that chimed in.

I'll be following up with some proposals for the async API. Hopefully we can
end up with something that is not "the least bad" option.

This series can be found in the for-luis-v4 branch of:
https://github.com/lostgoat/linux.git

Andres Rodriguez (9):
  firmware: some documentation fixes
  firmware: wrap FW_OPT_* into an enum
  firmware: add kernel-doc for enum fw_opt
  firmware: use () to terminate kernel-doc function names
  firmware: add function to load firmware without warnings v5
  firmware: print firmware name on fallback path
  firmware: use rename fw_sysfs_fallback to use the firmware_ prefix
  ath10k: use request_firmware_nowarn to load firmware
  ath10k: re-enable the firmware fallback mechanism for testmode

 .../driver-api/firmware/request_firmware.rst       | 21 +++++----
 drivers/base/firmware_loader/fallback.c            | 30 ++++++------
 drivers/base/firmware_loader/fallback.h            | 12 +++--
 drivers/base/firmware_loader/firmware.h            | 38 +++++++++++----
 drivers/base/firmware_loader/main.c                | 54 ++++++++++++++++------
 drivers/net/wireless/ath/ath10k/core.c             |  2 +-
 drivers/net/wireless/ath/ath10k/testmode.c         |  2 +-
 include/linux/firmware.h                           |  2 +
 8 files changed, 108 insertions(+), 53 deletions(-)

-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
