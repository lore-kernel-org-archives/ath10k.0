Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS0Dl-0006l6-JC
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 08:27:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: update regulatory domain settings for 10.x
 firmware
References: <1394797261-9219-1-git-send-email-marek.puzyniak@tieto.com>
Date: Mon, 24 Mar 2014 10:26:33 +0200
In-Reply-To: <1394797261-9219-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Fri, 14 Mar 2014 12:41:01 +0100")
Message-ID: <874n2o80jq.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> Regulatory domain settings for firmware 10.x has more options
> than main firmware, so handle regulatory domain setup separately
> for both supported firmwares. Fill in additional dfs domain
> parameter according to current regulatory.
> This patch does not solve any known bug. Not handled parameter
> for firmware 10.x was found during code review.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
