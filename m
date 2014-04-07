Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXAG0-0007vh-Iw
 for ath10k@lists.infradead.org; Mon, 07 Apr 2014 14:10:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: refactor radar detection code
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 7 Apr 2014 17:04:39 +0300
In-Reply-To: <1396610926-5787-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Apr 2014 13:28:46 +0200")
Message-ID: <87bnwdnslk.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If 20MHz CAC completed successfully then
> subsequent CAC with wider bandwidth (40Mhz, 80Mhz)
> with identical control frequency did not start
> monitor vdev making it impossible to detect any
> radar pulses during intended CAC.
>
> It also was incorrect to assume ath10k_config() will
> be called after CAC is finished. Theoretically for
> non-HT channels nothing changes between CAC and
> start_ap() (albeit in practice this can be
> different). The incorrect assumption led to CAC
> not being stopped on non-HT chandefs leading to
> all Rx being drooped making it impossible for
> clients to associate.
>
> While at it clean up the code a bit.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -858,6 +830,11 @@ static int ath10k_vdev_stop(struct ath10k_vif *arvif)
>  		return ret;
>  	}
>  
> +	if (!WARN_ON(ar->num_started_vdevs == 0)) {

Even though this is correct, I think it's still a bit evil. For example,
I missed '!' the first time I looked at this. Even this is a line
longer, I think it would be easier to read:

WARN_ON(ar->num_started_vdevs == 0);

if (ar->num_started_vdevs != 0) {
        ...
}

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
