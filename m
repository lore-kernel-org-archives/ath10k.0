Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNF1j-0002ke-Tp
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 05:47:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add device/driver strings to tracepoints
References: <1409231135-16233-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 29 Aug 2014 08:46:46 +0300
In-Reply-To: <1409231135-16233-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 28 Aug 2014 15:05:35 +0200")
Message-ID: <877g1ru9tl.fsf@kamboji.qca.qualcomm.com>
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

> This makes it easier to log and debug via tracing
> with more than 1 ath10k device on a system.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

In ath-next-test I had a simple conflict in wmi.c. Please check my
conflict resolution:

https://github.com/kvalo/ath/commit/d4bcfa9487e0837fdaf01645ade15acbadc3873c

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
