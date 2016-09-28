Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpEt5-0007Qp-Tj
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 13:27:05 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix debug cal data file
Date: Wed, 28 Sep 2016 13:26:36 +0000
Message-ID: <87fuokw3xw.fsf@kamboji.qca.qualcomm.com>
References: <1474341984-19220-1-git-send-email-mar.kolya@gmail.com>
In-Reply-To: <1474341984-19220-1-git-send-email-mar.kolya@gmail.com> (Nikolay
 Martynov's message of "Mon, 19 Sep 2016 23:26:24 -0400")
Content-Language: en-US
Content-ID: <69DCACD2F420384CADA55A408BE55B79@qualcomm.com>
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
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Nikolay Martynov <mar.kolya@gmail.com> writes:

> It got broken by 0b8e3c4ca29fe2c0efd3d41a76e34a657b9f17a4
>
> Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>

Good catch, I'll queue this to 4.9.

There was one checkpatch warning I fixed:

drivers/net/wireless/ath/ath10k/debug.c:1477: Prefer vmalloc(sizeof(*data)...) over vmalloc(sizeof(struct ath10k_debug_cal_data)...)

The commit log is quite short so added more information about the bug.
The full patch is in the pending branch.

Author: Nikolay Martynov <mar.kolya@gmail.com>
Date:   Wed Sep 28 15:11:52 2016 +0300

    ath10k: fix debug cal data file
    
    Commit 0b8e3c4ca29f ("ath10k: move cal data len to hw_params") broke retrieving
    the calibration data from cal_data debugfs file. The length of file was always
    zero. The reason is:
    
    static ssize_t ath10k_debug_cal_data_read(struct file *file,
                                          char __user *user_buf,
                                          size_t count, loff_t *ppos)
    {
        struct ath10k *ar = file->private_data;
        void *buf = file->private_data;
    
    
    This is obviously bogus, private_data cannot contain both struct ath10k and the
    buffer. Fix it by introducing a new temporary structure for storing both the
    length of the buffer and the actual buffer, then struct ath10k is not needed
    anymore.
    
    Fixes: 0b8e3c4ca29f ("ath10k: move cal data len to hw_params")
    Cc: stable@vger.kernel.org # 4.7+
    Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
    [kvalo@qca.qualcomm.com: improve commit log, fix a checkpatch warning]
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
