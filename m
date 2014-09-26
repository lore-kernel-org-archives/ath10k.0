Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXTQ5-0007Vy-Kr
 for ath10k@lists.infradead.org; Fri, 26 Sep 2014 11:10:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: change logging functions to return void
References: <1411407334.2952.46.camel@joe-AO725>
Date: Fri, 26 Sep 2014 14:10:05 +0300
In-Reply-To: <1411407334.2952.46.camel@joe-AO725> (Joe Perches's message of
 "Mon, 22 Sep 2014 10:35:34 -0700")
Message-ID: <87wq8q4oz6.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: wil6210 <wil6210@qca.qualcomm.com>, Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>, "John
 W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org

Joe Perches <joe@perches.com> writes:

> The return values are not used by callers of these functions
> so change the functions to return void.
>
> Other miscellanea:
>
> o add __printf verification to wil6210 logging functions
>   No format/argument mismatches found
>
> Signed-off-by: Joe Perches <joe@perches.com>

While applying this to our ath-next-test branch for build testing I had
few conflicts in ath10k. Joe, can you please check my conflict
resolution:

https://github.com/kvalo/ath/commit/9c5bd0cb84e4189ca85c041021aacdc015f3a9a5

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
