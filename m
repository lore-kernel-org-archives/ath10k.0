Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwxDv-0001g0-Ax
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 19:07:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Override CE5 configuration for QCA6147 device
References: <1446777867-5452-1-git-send-email-ryanhsu@qca.qualcomm.com>
Date: Thu, 12 Nov 2015 21:07:10 +0200
In-Reply-To: <1446777867-5452-1-git-send-email-ryanhsu@qca.qualcomm.com> (Ryan
 Hsu's message of "Thu, 5 Nov 2015 18:44:27 -0800")
Message-ID: <87ziyj595t.fsf@kamboji.qca.qualcomm.com>
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ryan Hsu <ryanhsu@qca.qualcomm.com> writes:

> 'Commit a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")'
> Introduces to use the unused CE5 for target to host message.
>
> For the device like QCA6174, CE5 already assigned for other feature.
> So for QCA6174, override the CE5 configuration and use the CE1 instead.
>
> This patch is based on Rajkumar's earlier patch.
>
> Fixes: a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Applied to ath-current, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
