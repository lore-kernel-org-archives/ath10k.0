Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YG6mq-0004LJ-E9
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 14:06:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: fix 10.2 fw stats
References: <1421413928-7282-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Jan 2015 16:06:02 +0200
In-Reply-To: <1421413928-7282-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 16 Jan 2015 14:12:06 +0100")
Message-ID: <87y4oob9o5.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, antonio@open-mesh.com, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> I've tested this briefly with main 636, 10.1.467,
> 10.2-00082-4 and 10.2.4.20. However I may have
> missed something so I'd be glad if someone can
> double-check me :-)
>
> Michal Kazior (2):
>   ath10k: split fw pdev stats parsing
>   ath10k: fix 10.2 fw stats parsing

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
