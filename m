Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V088G-000411-6U
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 10:41:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: 3.11.0-rc1: Crash on rmmod of ath10k_pci
References: <51E6FECE.40401@candelatech.com>
 <CA+BoTQ=xdE47uRB7-aBoXfczNss6uW_CDOC9aFmYq+Er+PPbpQ@mail.gmail.com>
 <51E7FBF7.2070102@candelatech.com>
Date: Fri, 19 Jul 2013 13:41:22 +0300
In-Reply-To: <51E7FBF7.2070102@candelatech.com> (Ben Greear's message of "Thu, 
 18 Jul 2013 07:30:15 -0700")
Message-ID: <87mwpi4yst.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>> You seem to have been lucky to trigger a race. CE is teared down
>> before we really stop interrupts and there's very small chance for an
>> interrupt to come in. This is strange, since CE interrupts are
>> disabled and only firmware (i.e. crash) interrupt may come in. I've
>> never seen firmware crash during module unloading. I have a patch for
>> this but it's based upon my recovery patchset and it's not trivial to
>> rebase the fix.
>
> I plan to do further testing on the 'ath' repository, so hopefully
> no need for porting patches around.  If/when that is stable, can see
> about testing mainline.

Yes, please base your work on the ath.git repository instead of mainline
(=Linus' releases). At this stage when we don't have that many users we
would not want to use time on the mainline, the time is much better
spent on improving the driver itself.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
