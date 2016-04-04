Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an5u3-0006EM-27
 for ath10k@lists.infradead.org; Mon, 04 Apr 2016 14:55:00 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v1 1/3] ath10k: Enable debugfs provision to enable Peer
 Stats feature
Date: Mon, 4 Apr 2016 14:54:26 +0000
Message-ID: <878u0te867.fsf@kamboji.qca.qualcomm.com>
References: <1458132214-4896-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1458132214-4896-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Wed, 16 Mar 2016 18:13:32	+0530")
Content-Language: en-US
Content-ID: <6ECF4323DDA7E44B8A0A3BB88761C991@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> Provide a debugfs entry to enable/ disable Peer Stats feature.
> Peer Stats feature is for developers/users who are more interested
> in studying in Rx/Tx stats with multiple clients connected, hence
> disable this by default. Enabling this feature by default results
> in unneccessary processing of Peer Stats event for every 500ms
> and updating peer_stats list (allocating memory) and cleaning it up
> ifexceeds the higher limit and this can be an unnecessary overhead
> during long run stress testing.
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

All three applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
