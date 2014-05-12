Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjsvJ-0001kB-6t
 for ath10k@lists.infradead.org; Mon, 12 May 2014 16:17:53 +0000
Message-ID: <5370F41A.70202@candelatech.com>
Date: Mon, 12 May 2014 09:17:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : [PATCH v2 2/2] ath10k: support get/set antenna
 configurations.
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 05/12/2014 08:43 AM, Vu Hai NGUYEN wrote:
> Thank you very much for the patch, I just had a question of a new bie: Your patch is for the branch of ath-next-test, not for the branch ath-master, right?
> But even it is for ath-next-test, I can not apply it, there is a conflict, for example the first change of your patch (in file "core.h" which starts from line 472 but I found in the branch of ath-next-test that it must start from line 444 where there is u32 dfs_block_radar_events; )
> So I have to apply your patch manually (I look for the different and add it to the code) and then the result is quite good, I can see the Available and Configured Antennas from "iw list". Then I can also select the antenna thanks to the command "iw phyX set antenna" too. 
> Sorry if I disturbing you for the question about applying the patch. 

My patch was against my own tree which is a mix of 3.14 and an older version of git://github.com/kvalo/ath.git

I do not have time right now to re-do the patch, but next time I get some time I will
fix the patch to apply to ath.git.  If someone else wants to do it first, I will not
complain :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
