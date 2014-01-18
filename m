Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4Smp-0002Uf-V6
 for ath10k@lists.infradead.org; Sat, 18 Jan 2014 10:05:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix the MAC address of peer statistic
References: <1389345564-21042-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmexjQy-+Bv-uofBa2Ndcu56yYOAEeNzdBSE3yMCQdZKw@mail.gmail.com>
 <87d2jqrajq.fsf@kamboji.qca.qualcomm.com>
 <CAEFj984ojBbfsMVi3VCQYcRqk2rMz+sq_MaH9JbDsuEmks0DTQ@mail.gmail.com>
Date: Sat, 18 Jan 2014 12:05:29 +0200
In-Reply-To: <CAEFj984ojBbfsMVi3VCQYcRqk2rMz+sq_MaH9JbDsuEmks0DTQ@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Sat, 18 Jan 2014 17:53:18 +0800")
Message-ID: <878uudob9y.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

>> This reminds me that Bartosz sent something related to this few months back:
>>
>> http://lists.infradead.org/pipermail/ath10k/2013-September/000317.html
>>
>
> Thanks, Michal and Kalle Valo for both your comments
>
> I just would like to know which version of firmware should we use?

It depends what you want to do. 10.1 firmare supports AP mode best, but
other modes are not supported or are otherwise buggy.

The main firmware "999.x" supports all modes, but AP mode support is not
that good as in 10.1.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
