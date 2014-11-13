Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XouMI-0006WV-Tw
 for ath10k@lists.infradead.org; Thu, 13 Nov 2014 13:22:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 06/10] ath10k: use configured nss instead of max nss.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-6-git-send-email-greearb@candelatech.com>
 <54592F3E.10204@candelatech.com>
Date: Thu, 13 Nov 2014 15:22:12 +0200
In-Reply-To: <54592F3E.10204@candelatech.com> (Ben Greear's message of "Tue,
 04 Nov 2014 11:55:42 -0800")
Message-ID: <87ioijteuz.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 09/23/2014 02:17 PM, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>> 
>> When re-associating a station, the nss was set back to
>> maximum value even if user had configured small number
>> of tx chains.  So, pay attention to user's config in
>> this case as well.
>
> Looks like this (and probably the related patch) did not make
> it upstream yet.
>
> Is someone waiting for more changes from me or did this just
> get lost?

Sorry, it fell through the cracks. I'll take a look at them soon.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
