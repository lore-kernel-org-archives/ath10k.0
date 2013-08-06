Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6bJ5-0003LX-QT
 for ath10k@lists.infradead.org; Tue, 06 Aug 2013 07:03:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add SoC power save option to PCI features map
References: <1375430329-23352-1-git-send-email-bartosz.markowski@tieto.com>
 <CA+BoTQkD5grL_5dJDgkwo40ET1zax56oN=ZGFxnyGqboQShbgQ@mail.gmail.com>
 <87iozkf5w0.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkCQMZaicJpcrJGk+vz7kwMgcQcLS6PUn_4c65PJ4gRTA@mail.gmail.com>
Date: Tue, 6 Aug 2013 10:03:17 +0300
In-Reply-To: <CA+BoTQkCQMZaicJpcrJGk+vz7kwMgcQcLS6PUn_4c65PJ4gRTA@mail.gmail.com>
 (Michal Kazior's message of "Tue, 6 Aug 2013 08:57:40 +0200")
Message-ID: <87iozjcnd6.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 5 August 2013 18:40, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> But this doesn't prevent taking this patch as the race has existed since
>> the beginning, right?
>
> I don't have anything against it.

That's what I assumed as well, just wanted to be sure before I commit
the patch.

> I just noticed the race and thought it's good to point out the issue.

Yes, that was a very good find. Please continue finding more races in
the code :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
