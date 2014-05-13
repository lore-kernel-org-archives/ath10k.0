Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkGqj-0008Uz-5u
 for ath10k@lists.infradead.org; Tue, 13 May 2014 17:50:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : [PATCH v2 2/2] ath10k: support get/set antenna
 configurations.
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
Date: Tue, 13 May 2014 20:50:14 +0300
In-Reply-To: <5370F41A.70202@candelatech.com> (Ben Greear's message of "Mon,
 12 May 2014 09:17:30 -0700")
Message-ID: <8738gdin55.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 05/12/2014 08:43 AM, Vu Hai NGUYEN wrote:
>> Thank you very much for the patch, I just had a question of a new bie: Your patch is for the branch of ath-next-test, not for the branch ath-master, right?
>> But even it is for ath-next-test, I can not apply it, there is a conflict, for example the first change of your patch (in file "core.h" which starts from line 472 but I found in the branch of ath-next-test that it must start from line 444 where there is u32 dfs_block_radar_events; )
>> So I have to apply your patch manually (I look for the different and add it to the code) and then the result is quite good, I can see the Available and Configured Antennas from "iw list". Then I can also select the antenna thanks to the command "iw phyX set antenna" too. 
>> Sorry if I disturbing you for the question about applying the patch. 
>
> My patch was against my own tree which is a mix of 3.14 and an older
> version of git://github.com/kvalo/ath.git
>
> I do not have time right now to re-do the patch, but next time I get
> some time I will fix the patch to apply to ath.git. If someone else
> wants to do it first, I will not complain :)

If you send patches agains some out-of-tree version of ath10k, PLEASE
state that clearly. I now wasted time trying to apply the patch, before
I read your reply.

The best (=easiest for me) is to base patches on master branch of my
ath.git tree.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
