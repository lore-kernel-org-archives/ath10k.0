Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGkog-0007w7-Ci
 for ath10k@lists.infradead.org; Tue, 03 Sep 2013 07:14:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 2/2] ath10k: implement per-VDEV FW statistics
References: <1377778061-22331-1-git-send-email-bartosz.markowski@tieto.com>
 <1377778061-22331-3-git-send-email-bartosz.markowski@tieto.com>
Date: Tue, 3 Sep 2013 10:13:55 +0300
In-Reply-To: <1377778061-22331-3-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 29 Aug 2013 14:07:40 +0200")
Message-ID: <87a9ju1ioc.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> The WMI_REQUEST_PEER_STAT command with latst (1.0.0.716) FW
> can return per-VDEV statistics. Using debugfs we can fetch this info now.
>
> This is a backward compatible change. In case of older FW the VDEV
> statistics are simply not returned.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

>  	if (num_peer_stats) {
> -		struct wmi_peer_stats *peer_stats;
>  		struct ath10k_peer_stat *s;
> +		struct wmi_peer_stats_1 *peer_stats_1;
> +		struct wmi_peer_stats_2 *peer_stats_2;
>  
>  		stats->peers = num_peer_stats;
>  
>  		for (i = 0; i < num_peer_stats; i++) {
> -			peer_stats = (struct wmi_peer_stats *)tmp;
> +			peer_stats_1 = (struct wmi_peer_stats_1 *)tmp;

You still have this evil cast here which assumes struct wmi_peer_stats_1
starts with the same content as _2. It's better to spell that out in the
code, for example like this:

if (test_bit(ATH10K_FW_FEATURE_VDEV_STATS, ar->fw_features)) {
             peer_v2 = (struct wmi_peer_stats_v2 *)tmp;
             peer_stats = &peer_v2->common;
             tmp += sizeof(*peer_v2);
} else {
             peer_v1 = (struct wmi_peer_stats_v1 *)tmp;
             peer_stats = &peer_v1->common;
             tmp += sizeof(*peer_v1);
}

> +struct wmi_peer_stats_1 {

struct wmi_peer_stats_v1

> +struct wmi_peer_stats_2 {

struct wmi_peer_stats_v2

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
