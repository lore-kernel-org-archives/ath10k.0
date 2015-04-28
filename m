Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn4y0-0000Y7-7i
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 12:50:25 +0000
Received: by wizk4 with SMTP id k4so139084126wiz.1
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2015 05:50:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150428124116.GC4527@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <20150428124116.GC4527@localhost>
Date: Tue, 28 Apr 2015 20:50:01 +0800
Message-ID: <CAEFj987sVTAn8ABk70AhtDcr2wA+RTH6eXKtgOk26h=pZ5A-JA@mail.gmail.com>
Subject: Re: attempting mesh on ath10k
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Great works, Bob.

Which AP firmware that you have tested with?

----
Chun-Yeow

On Tue, Apr 28, 2015 at 8:41 PM, Bob Copeland <me@bobcopeland.com> wrote:
> On Sat, Apr 25, 2015 at 01:55:32AM +0800, Chun-Yeow Yeoh wrote:
>> Hi, Bob
>>
>> I have tried converting the "adhoc" mode on the
>> firmware-2.bin_999.999.0.636 as mesh interface.
>>
>> You can find my patches here:
>> https://github.com/chunyeow/ath/commits/mesh
>>
>> But probably too many workaround and won't be able to interoperate
>> with other mesh interface.
>
> Yeah, I think adhoc will not work so well due to TSF sync and the
> distributed beacon algorithm.  So I'm happy that AP approach seems
> viable; of course dedicated mesh vdev type would be nice :)
>
> --
> Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
