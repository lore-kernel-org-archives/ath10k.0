Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0161.hostedemail.com ([216.40.44.161]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXZ9m-0003rR-1x
 for ath10k@lists.infradead.org; Fri, 26 Sep 2014 17:18:10 +0000
Message-ID: <1411751863.19443.7.camel@joe-AO725>
Subject: Re: [PATCH] ath: change logging functions to return void
From: Joe Perches <joe@perches.com>
Date: Fri, 26 Sep 2014 10:17:43 -0700
In-Reply-To: <87wq8q4oz6.fsf@kamboji.qca.qualcomm.com>
References: <1411407334.2952.46.camel@joe-AO725>
 <87wq8q4oz6.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: wil6210 <wil6210@qca.qualcomm.com>, Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>, "John W.
 Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org

On Fri, 2014-09-26 at 14:10 +0300, Kalle Valo wrote:
> Joe Perches <joe@perches.com> writes:
> 
> > The return values are not used by callers of these functions
> > so change the functions to return void.
> >
> > Other miscellanea:
> >
> > o add __printf verification to wil6210 logging functions
> >   No format/argument mismatches found
> >
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> While applying this to our ath-next-test branch for build testing I had
> few conflicts in ath10k. Joe, can you please check my conflict
> resolution:
> 
> https://github.com/kvalo/ath/commit/9c5bd0cb84e4189ca85c041021aacdc015f3a9a5
> 

I don't know what the conflicts were, but the
changes seem fine to me.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
