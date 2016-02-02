Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQYzf-0000LO-Lx
 for ath10k@lists.infradead.org; Tue, 02 Feb 2016 11:19:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/5] ath10k: add basic hostq support
References: <1452693668-30030-1-git-send-email-michal.kazior@tieto.com>
 <1453382007-24622-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 2 Feb 2016 13:19:03 +0200
In-Reply-To: <1453382007-24622-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 21 Jan 2016 14:13:22 +0100")
Message-ID: <87r3gvgy1k.fsf@kamboji.qca.qualcomm.com>
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

> There's a new firmware feature which uses a shared
> DMA memory so host can share it's per-sta per-tid
> queue size which is then subsequently used for
> firmware to assist in deciding which frames to put
> on the intermediate host-device tx queue.
>
> This patchset adds only basic support to make
> the firmware supporting the feature happy and
> running at all. Without it firmware would freeze
> shortly after booting.
>
> More patches will follow some time later to add
> the "new data path" logic.
>
>
> v2:
>  * fix gfp allocation [Ben]
>
>
> Michal Kazior (5):
>   ath10k: rename some HTT events
>   ath10k: add new htt definitions
>   ath10k: add new FW_FEATURE_PEER_FLOW_CONTROL
>   ath10k: clean up cont frag desc init code
>   ath10k: implement basic support for new tx path firmware

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
