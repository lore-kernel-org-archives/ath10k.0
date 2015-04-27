Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymiey-0007km-G0
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 13:01:17 +0000
Received: by iejt8 with SMTP id t8so125149346iej.2
 for <ath10k@lists.infradead.org>; Mon, 27 Apr 2015 06:00:52 -0700 (PDT)
Date: Mon, 27 Apr 2015 09:00:16 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150427130016.GA28926@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <553AEFFA.6010709@candelatech.com>
 <20150426141552.GA25938@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150426141552.GA25938@localhost>
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
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Sun, Apr 26, 2015 at 10:15:52AM -0400, Bob Copeland wrote:
> So, progress!
> 
> There's still an issue with datapath -- while it looks like we can establish
> plinks, I couldn't get unicast traffic flowing even if manually setting up
> mpaths and arp table entries.  I haven't yet got all of my 5 ghz capable gear
> in the same room to monitor and see where the problem lies.

Now I had a chance to monitor it, and in so doing, rediscovered this patch of
Chun-Yeow's:

http://lists.infradead.org/pipermail/ath10k/2014-September/003206.html

In fact my broadcasts were truncated and the above change makes the broadcast
ARPs look correct over the air.  The (non-ath10k) target mesh STA replies with
broadcast PREQ but that is not received / processed / replied-to by the
ath10k device.

Perhaps there is a BSSID filter enabled or something like that (in mesh
there's no BSSID, just individual addresses on group addressed frames).

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
