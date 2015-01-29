Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGoGm-0005Ff-JT
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 12:32:25 +0000
Date: Thu, 29 Jan 2015 18:01:47 +0530
From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k:Prevent setting wrong key idx for station
Message-ID: <20150129123145.GA11854@senthilj-ThinkPad-L430>
References: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
 <54C7C3B7.4020706@candelatech.com>
 <87fvat3ml0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fvat3ml0.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "Balasubramanian, Senthil Kumar" <senthilb@qti.qualcomm.com>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jan 29, 2015 at 04:01:07PM +0530, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
> > On 01/27/2015 06:30 AM, senthilb@qti.qualcomm.com wrote:
> >> From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
> >> 
> >> Ath10k driver sets wrong default key idx that results in
> >> sending unicast frames with multicast key.
> >
> > Is this something that should be back-ported to stable releases?
> 
> Sure, if somebody cares about WEP that much :) 
> 
> Should I add CC stable to the patch?
> 
> -- 
> Kalle Valo

Considering the size of the patch  and WEP alg which is least used, I dont see
this change as  candidate for stable release backport.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
