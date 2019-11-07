Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSaSJ-0007mT-57
 for ath10k@lists.infradead.org; Thu, 07 Nov 2019 05:35:40 +0000
MIME-Version: 1.0
Date: Thu, 07 Nov 2019 13:35:37 +0800
From: zhichen@codeaurora.org
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
In-Reply-To: <CAKR_QVL9QLE72y0HBD_miLYAD4qx73u3FK33=oNCHp_S8H6JOw@mail.gmail.com>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <CAKR_QVLDFBVMDDP4mPYVNdpT9TA3podNeQMpVJQwE7A5eG=0kA@mail.gmail.com>
 <9bb484b94c43f7c9aa08345ad89d7b2c@codeaurora.org>
 <CAKR_QVL9QLE72y0HBD_miLYAD4qx73u3FK33=oNCHp_S8H6JOw@mail.gmail.com>
Message-ID: <a60168b26275f4400434e72fabac244b@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-11-06 18:01, Tom Psyborg wrote:
> On 30/10/2019, zhichen@codeaurora.org <zhichen@codeaurora.org> wrote:
>> On 2019-10-22 18:07, Tom Psyborg wrote:
>> 
>>> What about main and 10x firmware branch?
>> 
>> There is no code changes in firmware. It's a configuration change of
>> host memory access.
>> 
>> Zhi
>> 
> 
> Please change it for main and 10x branch too. Dumping hw1.0 regs with
> QCA driver shows DMA burst value set to 1

Looks some old chips have different definitions of DMA burst size. We 
are discussing internally to change it for 10.4 only because we only 
tested 10.4.  On the other hand we are waiting for HW team to explain 
the differences.

Zhi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
