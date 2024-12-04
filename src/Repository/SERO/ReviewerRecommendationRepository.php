<?php

namespace App\Repository\SERO;

use App\Entity\SERO\ReviewerRecommendation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ReviewerRecommendation>
 *
 * @method ReviewerRecommendation|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReviewerRecommendation|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReviewerRecommendation[]    findAll()
 * @method ReviewerRecommendation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReviewerRecommendationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReviewerRecommendation::class);
    }

    //    /**
    //     * @return ReviewerRecommendation[] Returns an array of ReviewerRecommendation objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?ReviewerRecommendation
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
