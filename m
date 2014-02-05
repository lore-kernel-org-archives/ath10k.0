Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAxk2-0002vu-U9
 for ath10k@lists.infradead.org; Wed, 05 Feb 2014 08:21:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: Get rid of superfluous call to
 pci_disable_msi()
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
 <20140130134819.GA31909@dhcp-26-207.brq.redhat.com>
 <87y51qohjn.fsf@kamboji.qca.qualcomm.com>
 <20140204190935.GA1430@dhcp-26-207.brq.redhat.com>
Date: Wed, 5 Feb 2014 10:21:28 +0200
In-Reply-To: <20140204190935.GA1430@dhcp-26-207.brq.redhat.com> (Alexander
 Gordeev's message of "Tue, 4 Feb 2014 20:09:36 +0100")
Message-ID: <8761oum0l3.fsf@kamboji.qca.qualcomm.com>
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
To: Alexander Gordeev <agordeev@redhat.com>
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Alexander Gordeev <agordeev@redhat.com> writes:

> On Tue, Feb 04, 2014 at 08:32:12PM +0200, Kalle Valo wrote:
>> Alexander Gordeev <agordeev@redhat.com> writes:
>> 
>> I don't understand how this is superfluous. When I read the
>> documentation for pci_enable_msi_block() it states that if it can't
>> allocate all requests, it will return the number requests it could
>> allocate. And in that case we want to fall back other modes.
>> 
>> Am I missing something?
>
> Yep. The documentation states 'could have been allocated', not 'could
> allocate'. IOW, MSIs are *not* enabled if a positive value returned.
> The code I changed tries to disable MSIs in such case, although it is
> not necessary, nor required. Just superfluous.

Ah, thanks for explaining that. I added this to the commit log (I hate
empty commit logs anyway):

    ath10k: Get rid of superfluous call to pci_disable_msi()
    
    The documentation states that pci_enable_msi_block() returns the number of
    requests 'could have been allocated', not 'could allocate'. IOW, MSIs are *not*
    enabled if a positive value returned.
    
    kvalo: add commit log based on Alexander's email
    
    Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Is it ok for me to take these patches to my ath.git tree or would you
prefer to route them some other way?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
