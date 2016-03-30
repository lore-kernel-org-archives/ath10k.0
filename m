Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alD21-0003qJ-RO
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 10:07:22 +0000
Received: by mail-wm0-x230.google.com with SMTP id p65so63998267wmp.0
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 03:07:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FAF40B.1040301@candelatech.com>
References: <56FAF40B.1040301@candelatech.com>
Date: Wed, 30 Mar 2016 12:07:00 +0200
Message-ID: <CA+BoTQkfYwCfH2iWyzWbugCK50whafctRtfy928tzHpo7oq7ZQ@mail.gmail.com>
Subject: Re: Why is peer->peer_ids a bitmap?
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 29 March 2016 at 23:30, Ben Greear <greearb@candelatech.com> wrote:
> Can a single peer object really have more than one ID?

When you install keys you typically get more ids via htt-peer-map
event. I think there were some other cases as well..


> Is this trying to deal with shared peer objects, perhaps?

This was developed very long ago when peer-id mapping wasn't really
well understood. Perhaps we could make do without peer id map now?
i.e. only care about the first htt-peer-map per peer address?


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
