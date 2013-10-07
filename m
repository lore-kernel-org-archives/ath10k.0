Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTDjJ-0001TK-I3
 for ath10k@lists.infradead.org; Mon, 07 Oct 2013 16:32:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: wep & ampdu fix
References: <to=1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 7 Oct 2013 19:31:54 +0300
In-Reply-To: <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Oct 2013 10:17:08 +0200")
Message-ID: <87txgtt539.fsf@kamboji.qca.qualcomm.com>
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
> One throughput fix and one bug fix.
>
> The bug fix addresses my oversight when reworking
> HTC/WMI. I haven't seen the error yet but I'm
> quite certain this should be fixed.
>
> v2:
>  * A-MPDU patch contains a workaround for
>    Netgear/Linksys 11ac APs
>    (Kalle, can you kindly test this, please?)

I quickly tested patch 1 with D-Link DIR-865L. I didn't notice any
regressions so that part looks good. Though I didn't notice any
improvement either. But as long as there's no regression I'm happy :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
