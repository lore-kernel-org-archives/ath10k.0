Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn4pa-0005K9-8e
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 12:41:43 +0000
Received: by igbyr2 with SMTP id yr2so89216220igb.0
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2015 05:41:20 -0700 (PDT)
Date: Tue, 28 Apr 2015 08:41:16 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150428124116.GC4527@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Sat, Apr 25, 2015 at 01:55:32AM +0800, Chun-Yeow Yeoh wrote:
> Hi, Bob
> 
> I have tried converting the "adhoc" mode on the
> firmware-2.bin_999.999.0.636 as mesh interface.
> 
> You can find my patches here:
> https://github.com/chunyeow/ath/commits/mesh
> 
> But probably too many workaround and won't be able to interoperate
> with other mesh interface.

Yeah, I think adhoc will not work so well due to TSF sync and the
distributed beacon algorithm.  So I'm happy that AP approach seems
viable; of course dedicated mesh vdev type would be nice :)

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
