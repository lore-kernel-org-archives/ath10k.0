Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YyLU2-0003M1-NN
 for ath10k@lists.infradead.org; Fri, 29 May 2015 14:42:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 1/3] ath10k: move cycle_count macro
In-Reply-To: <1432555579-18347-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 May 2015 14:06:17 +0200")
References: <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 <1432555579-18347-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 29 May 2015 17:41:14 +0300
Message-ID: <87vbfbwinp.fsf@kamboji.qca.qualcomm.com>
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

> The macro isn't WMI specific. Instead it is
> related to hardware chip so move the macro
> accordingly. While at it document the magic value.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
