Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buBjY-0006uy-AJ
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 05:05:41 +0000
MIME-Version: 1.0
Subject: Re: [v3] ath10k: cache calibration data when the core is stopped
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1476115204-7385-1-git-send-email-kvalo@qca.qualcomm.com>
References: <1476115204-7385-1-git-send-email-kvalo@qca.qualcomm.com>
Message-ID: <56268b973ebe4cfa9f80592b2110999b@euamsexm01a.eu.qualcomm.com>
Date: Wed, 12 Oct 2016 07:05:00 +0200
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
Cc: linux-wireless@vger.kernel.org, Marty Faltesek <mfaltesek@google.com>, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> From: Marty Faltesek <mfaltesek@google.com>
> 
> Commit 0b8e3c4ca29f ("ath10k: move cal data len to hw_params") broke retrieving
> the calibration data from cal_data debugfs file. The length of file was always
> zero. The reason is:
> 
>     static ssize_t ath10k_debug_cal_data_read(struct file *file,
>                                           char __user *user_buf,
>                                           size_t count, loff_t *ppos)
>     {
>         struct ath10k *ar = file->private_data;
>         void *buf = file->private_data;
> 
> 
> This is obviously bogus, private_data cannot contain both struct ath10k and the
> buffer. Fix it by caching calibration data to ar->debug.cal_data. This also
> allows it to be accessed when the device is not active (interface is down).
> 
> The cal_data buffer is fixed size because during the first firmware probe we
> don't yet know what will be the lenght of the calibration data. It was simplest
> just to use a fixed length. There's a WARN_ON() in
> ath10k_debug_cal_data_fetch() if the buffer is too small.
> 
> Tested with qca988x and firmware 10.2.4.70.56.
> 
> Reported-by: Nikolay Martynov <mar.kolya@gmail.com>
> Fixes: 0b8e3c4ca29f ("ath10k: move cal data len to hw_params")
> Cc: stable@vger.kernel.org # 4.7+
> Signed-off-by: Marty Faltesek <mfaltesek@google.com>
> [kvalo@qca.qualcomm.com: improve commit log and minor other changes]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

There were few checkpatch warnings, I fixed those in the pending branch.

drivers/net/wireless/ath/ath10k/debug.c:1472: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:1504: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:1504: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/debug.c:1505: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:1505: please, no spaces at the start of a line

-- 
https://patchwork.kernel.org/patch/9369685/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
