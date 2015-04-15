Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiM0N-0003KN-Fq
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 12:01:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: support new FCC DFS Radar Type 1
References: <1427305036-20326-1-git-send-email-poh@qca.qualcomm.com>
Date: Wed, 15 Apr 2015 15:00:45 +0300
In-Reply-To: <1427305036-20326-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Wed, 25 Mar 2015 10:37:16 -0700")
Message-ID: <87sic17g9e.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Add support for new FCC DFS rules released on August 14, 2014.
> FCC has added a new radar type named Radar Type 1 and original
> Radar Type 1 is renamed to Radar Type 0 in consequence.
>
> During the certificate test, Type 1 PRI values are randomly selected
> within the range of 518 and 3066 and we divide it to 3 groups based on
> practical test result data collected for more than a year.
>
> For about Radar type ID, it does nothing to functionalities.
> In other words, even if we re-order the IDs, DFS detection will
> work as well, but we give the ID with matching to FCC doc.
>
> By adding this support, the drivers using this DFS function are
> able to support both of old and new FCC DFS rules simultaneously
> without any other changes.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
