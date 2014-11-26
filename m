Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtRkk-00083G-2I
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 01:50:46 +0000
Message-ID: <547531E0.6040707@candelatech.com>
Date: Tue, 25 Nov 2014 17:50:24 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS mode is now supported by CT firmware.
References: <547525D4.5080701@candelatech.com>
 <CAEFj9850cLVSVH=BmDNwZwEpgymRhLS2yeVGgn5gUMxkj3Wunw@mail.gmail.com>
 <54752F3E.6000704@candelatech.com>
 <CAEFj984VgP2u2ehBzmY6U=utRmKOAjxF_-bY+FPxgwxma5hu_g@mail.gmail.com>
In-Reply-To: <CAEFj984VgP2u2ehBzmY6U=utRmKOAjxF_-bY+FPxgwxma5hu_g@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 11/25/2014 05:48 PM, Yeoh Chun-Yeow wrote:
> Is this the only patch we need to enable IBSS mode?
> http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=commit;h=af9dabe5f23e2ad8f8603a5156ebe9227340e9e3
> 
> Please advice. Thanks

Sort of, but that is patching a previous patch of mine that is not upstream.

So, you are going to have to go crawling through the code a bit
to find out how to do a similar action in your code base.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
