Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAyG8-0003n0-Uz
 for ath10k@lists.infradead.org; Wed, 05 Feb 2014 08:55:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: Get rid of superfluous call to
 pci_disable_msi()
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
 <20140130134819.GA31909@dhcp-26-207.brq.redhat.com>
 <87y51qohjn.fsf@kamboji.qca.qualcomm.com>
 <20140204190935.GA1430@dhcp-26-207.brq.redhat.com>
 <8761oum0l3.fsf@kamboji.qca.qualcomm.com>
 <20140205085047.GA27820@dhcp-26-207.brq.redhat.com>
Date: Wed, 5 Feb 2014 10:54:37 +0200
In-Reply-To: <20140205085047.GA27820@dhcp-26-207.brq.redhat.com> (Alexander
 Gordeev's message of "Wed, 5 Feb 2014 09:50:48 +0100")
Message-ID: <871tzilz1u.fsf@kamboji.qca.qualcomm.com>
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

> On Wed, Feb 05, 2014 at 10:21:28AM +0200, Kalle Valo wrote:
>> Is it ok for me to take these patches to my ath.git tree or would you
>> prefer to route them some other way?
>
> Yeah, Bjorn has indicated he would pull it to his tree.

Ok, I'll drop these from my pending branch then. I just think it would
have been easier if I would take these, smaller chance of conflicts that
way.

> I get it you are fine with 2/3 and 3/3?

Yes, with the addition of the commit log to 1/3 I'll give:

Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
