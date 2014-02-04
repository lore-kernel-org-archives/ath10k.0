Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAYyo-0004gI-Pz
 for ath10k@lists.infradead.org; Tue, 04 Feb 2014 05:55:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k:  Print out size of wmi-ready-event message.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-2-git-send-email-greearb@candelatech.com>
 <87lhxzdj21.fsf@kamboji.qca.qualcomm.com>
 <52EFC99E.2030702@candelatech.com>
Date: Tue, 4 Feb 2014 07:55:02 +0200
In-Reply-To: <52EFC99E.2030702@candelatech.com> (Ben Greear's message of "Mon, 
 3 Feb 2014 08:53:50 -0800")
Message-ID: <8761ovs9qh.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 01/29/2014 05:16 AM, Kalle Valo wrote:
>> greearb@candelatech.com writes:
>
>> And I guess you saw the compiler warning from the build bot for this
>> patch?
>
> Actually, if it's convenient, just drop this patch.  It was to debug
> what turned out to be improperly packaged firmware, and there is little
> chance of ever hitting that in the field.
>
> If instead you need me to fix the compile warning, I'll send an updated
> patch.

Up to you. I was planning to take the patch, but had to drop it because
of the warning.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
