Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqjVI-0007Ta-4o
 for ath10k@lists.infradead.org; Tue, 18 Nov 2014 14:11:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: TX Power Concerns between Firmware
References: <CAD1M062Um6PY2fE4AiM6D3=_McdTMkixzYQ23kYwM7_xdZR=wA@mail.gmail.com>
 <CA+BoTQkTpV1LViDWAj1yZwCgshStzHhGe9DTD8S++DK8uUe9oQ@mail.gmail.com>
Date: Tue, 18 Nov 2014 16:11:07 +0200
In-Reply-To: <CA+BoTQkTpV1LViDWAj1yZwCgshStzHhGe9DTD8S++DK8uUe9oQ@mail.gmail.com>
 (Michal Kazior's message of "Wed, 5 Nov 2014 15:09:46 +0100")
Message-ID: <87ioick39g.fsf@kamboji.qca.qualcomm.com>
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
Cc: Pushpal Sidhu <psidhu@gateworks.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> @Kalle: Now that I think about it - do we really need to embed otp binaries?

In theory we could release otp.bin separetely. But that would be error
prone from user's point of view (they need to update two files instead
of just one), more work for us to track otp.bin releases etc.

So I'm not really fond of the idea. I would rather update otp.bin and
create a new firmware version.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
