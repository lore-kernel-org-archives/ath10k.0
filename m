Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPCb8-000070-PD
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 14:31:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: make monitor vdev down before stoping it
References: <1380024384-30512-1-git-send-email-marek.puzyniak@tieto.com>
Date: Thu, 26 Sep 2013 17:30:46 +0300
In-Reply-To: <1380024384-30512-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Tue, 24 Sep 2013 14:06:24 +0200")
Message-ID: <871u4bpsdl.fsf@kamboji.qca.qualcomm.com>
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

> Following sequence causes FW crash:
> -monitor vdev up,
> -monitor vdev stop,
> -monitor vdev delete.
> Making monitor vdev down before stoping it works ok:
> -monitor vdev up,
> -monitor vdev down,
> -monitor vdev stop,
> -monitor vdev delete.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
