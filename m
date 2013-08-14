Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9cbE-0003cK-A4
 for ath10k@lists.infradead.org; Wed, 14 Aug 2013 15:03:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: fixes
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 14 Aug 2013 18:02:30 +0300
In-Reply-To: <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 13 Aug 2013 07:59:34 +0200")
Message-ID: <87a9kk48op.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> This patchset contains some bugfixes and
> improvements.
>
> v2:
>  * fix indentation
>  * use a comment instead of a no-op if clause
>

Thanks, these three patches applied:

>   ath10k: fix HTT service setup
>   ath10k: implement 802.3 SNAP rx decap type A-MSDU handling
>   ath10k: plug possible memory leak in WMI

This patch dropped per your request:

>   ath10k: fix HTC endpoint worker starvation

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
