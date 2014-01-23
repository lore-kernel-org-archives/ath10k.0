Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Doe-0006qn-3m
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 06:31:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k:  Support 32 stations.
References: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
Date: Thu, 23 Jan 2014 08:30:21 +0200
In-Reply-To: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 22 Jan 2014 16:41:15
 -0800")
Message-ID: <8761pb9pmq.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Implement 64-bit vdev map to support larger numbers
> of virtual devices.  Support up to 32 stations
> (actual limit will be determined when loading firmware,
> as different firmwares have different limits)
>
> Enable larger limits when using Candela Technologies
> firmware.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

We are currently maintaining two different firmware branches which adds
extra effort to the developers. To be honest I'm not exactly thrilled to
start supporting a third one. Can't you maintain these out-of-tree, at
least for the time being?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
