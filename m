Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdxpH-0006T9-KQ
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 07:46:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: What to do about hung firmware?
References: <52793E4B.20302@candelatech.com>
 <CA+BoTQk2EZddNywAMRLF2qpWafpD4OvyDrtvg+iTM4atcm44ig@mail.gmail.com>
Date: Wed, 6 Nov 2013 09:46:14 +0200
In-Reply-To: <CA+BoTQk2EZddNywAMRLF2qpWafpD4OvyDrtvg+iTM4atcm44ig@mail.gmail.com>
 (Michal Kazior's message of "Wed, 6 Nov 2013 08:07:15 +0100")
Message-ID: <87ob5yt1kp.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> You probably could try WMI_ECHO_CMDID to implement a keep alive when
> idling (i.e. not sending WMI commands for a few seconds at least).

Sending something periodically would be bad from power consumption point
of view. We would need to either disable it by default, only send it if
there's a problem or something like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
