Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHLo-0004vA-Uf
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:35:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: pci fixes 2014-05-15
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 16 May 2014 15:34:34 +0300
In-Reply-To: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 15 May 2014 14:48:56 +0200")
Message-ID: <878uq17vhh.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> Patches 1 and 2 were made as a result of analysing
> `ath10k firmware crash after 4 hours of heavy TCP
> traffic` bug reported by Avery.
>
> Patch 3 fixes a bug reported by Avery that was
> apparently related to missing memory barriers on
> his ARM test system. @Avery, can you take a look
> or test it, please? I was never able to reproduce
> this but it just seems like the right thing to do.
> Or you can simply post your patch and I'll drop
> mine then.

I think it would be good still to wait a while with patch 3 as
apparently Avery is still seeing some odd firmware crashes. Once we are
confident that the memory barrier issues are handled we come up with a
final patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
