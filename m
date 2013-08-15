Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9xKB-0005RE-V3
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 13:10:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: firmware-related updates
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1376036014-29707-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Aug 2013 16:09:01 +0300
In-Reply-To: <1376036014-29707-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 Aug 2013 10:13:31 +0200")
Message-ID: <87d2pf14pe.fsf@kamboji.qca.qualcomm.com>
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
> This patchset contains 2 firmware-related upgrades
> and 1 fix (that I though is a good pick to include
> here, since it's related with HTT tx).
>
> This keeps backward compatbility with old
> firmware.
>
> This includes fixes for issues pointed out during
> RFC review.

[...]

> Michal Kazior (3):
>   ath10k: clean up HTT tx tid handling

I dropped this patch.

>   ath10k: add support for firmware newer than 636
>   ath10k: add support for HTT 3.0

These two are applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
