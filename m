Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XswtL-00063x-Vj
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 16:53:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: add memory dump debugfs interface
References: <20141124164037.29422.14033.stgit@potku.adurom.net>
 <20141124164208.29422.76134.stgit@potku.adurom.net>
Date: Mon, 24 Nov 2014 18:52:58 +0200
In-Reply-To: <20141124164208.29422.76134.stgit@potku.adurom.net> (Kalle Valo's
 message of "Mon, 24 Nov 2014 18:42:08 +0200")
Message-ID: <87mw7g4k2d.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> +	ret = copy_from_user(buf, user_buf, count);
> +	if (ret)
> +		goto err_free_copy;
> +
> +	ret = ath10k_hif_diag_write(ar, *ppos, buf, count);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to write address 0x%08x via diagnose window from debugfs: %d\n",
> +			    (u32)(*ppos), ret);
> +		goto err_free_copy;
> +	}
> +
> +	*ppos += count;
> +	ret = count;
> +
> +err_free_copy:
> +	vfree(buf);
> +	return ret;

This introduces a new smatch warning:

drivers/net/wireless/ath/ath10k/debug.c:1100 ath10k_mem_value_write()
warn: maybe return -EFAULT instead of the bytes remaining?

I think it should be like this:

ret = copy_from_user(buf, user_buf, count);
if (ret) {
        ret = -EFAULT;
	goto err_free_copy;
}

Comments?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
