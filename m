Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMGrG-0005Gg-Ej
 for ath10k@lists.infradead.org; Fri, 13 Feb 2015 14:04:38 +0000
Date: Fri, 13 Feb 2015 19:33:54 +0530
From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: Increase AST table SKID length limit
Message-ID: <20150213140352.GA3958@senthilj-ThinkPad-L430>
References: <1423733322-31113-1-git-send-email-sjegadee@qti.qualcomm.com>
 <54DCA6F1.90909@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54DCA6F1.90909@candelatech.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Feb 12, 2015 at 05:13:21AM -0800, Ben Greear wrote:
> 
> 
> On 02/12/2015 01:28 AM, SenthilKumar Jegadeesan wrote:
> >The current SKID length configuration causes firmware
> >to reject peer creation for not able to allocate
> >AST entries for peers. This issue is observed when
> >least significant 3 bytes are used ramdomly to create
> >client MAC addresses.
> >
> >AST table SKID length configuration is increased to
> >maximum value to fix this issue.
> 
> If your firmware is like 10.1, then probably AST length should
> really be same as config.num_peers?
> 
> 10.1 firmware definitely has same or similar issue in it's
> AST table handling, for what that is worth.
> 
> Thanks,
> Ben

I agree. New patch will address this case.

Thanks,
Senthil J

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
